#!/usr/bin/env python3
"""Verify the Cask points to the published app and checksum, without installing."""
import hashlib
import io
import pathlib
import plistlib
import re
import urllib.request
import zipfile

text = pathlib.Path("Casks/gksdud.rb").read_text()
version_matches = re.findall(r'^  version "([0-9]+\.[0-9]+\.[0-9]+)"$', text, re.M)
hash_matches = re.findall(r'^  sha256 "([a-f0-9]{64})"$', text, re.M)
assert len(version_matches) == len(hash_matches) == 1, "Unexpected version or checksum"
version, digest = version_matches[0], hash_matches[0]
assert 'url "https://github.com/codingnoye/gksdud/releases/download/v#{version}/gksdud-#{version}.zip"' in text
assert 'app "gksdud.app"' in text
name = f"gksdud-{version}.zip"
root = f"https://github.com/codingnoye/gksdud/releases/download/v{version}/"


def download(name, limit):
    with urllib.request.urlopen(root + name, timeout=60) as response:
        result = response.read(limit + 1)
    assert len(result) <= limit, "Asset exceeds size limit"
    return result


archive = download(name, 20 * 1024 * 1024)
assert hashlib.sha256(archive).hexdigest() == digest, "Cask checksum mismatch"
# The release also lists the self-signed copy that apps up to 1.7.1 download.
assert f"{digest}  {name}\n" in download("SHA256SUMS", 4096).decode(), "Release checksum mismatch"
with zipfile.ZipFile(io.BytesIO(archive)) as bundle:
    info = bundle.getinfo("gksdud.app/Contents/Info.plist")
    assert info.file_size < 65536
    plist = plistlib.loads(bundle.read(info))
assert plist["CFBundleShortVersionString"] == version
assert plist["CFBundleIdentifier"] == "io.gksdud.inputswitch"
print(f"PASS: published gksdud {version}, Cask checksum, release checksum and app identity")
