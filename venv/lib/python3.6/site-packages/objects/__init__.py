"""A corpus of object images."""

from base64 import b64encode
import hashlib
import os
import shutil
import urllib
import zipfile

object_dir = os.path.dirname(os.path.realpath(__file__))

def objects(idx):
    all = [Object(p) for p in sorted(os.listdir(object_dir)) if p.endswith(".jpg")]
    return all[idx]

def download():
    """Download the corpus."""
    corpus = urllib.URLopener()
    url = "https://bradylab.ucsd.edu/stimuli/ObjectsAll.zip"
    corpus.retrieve(url, "corpus.zip")
    hash = hashlib.md5(open("corpus.zip", 'rb').read()).hexdigest()

    # Check the md5 hash.
    if hash != "34361346f8f1a39dc48d42fc6bb3b413":
        raise Exception("md5 hash of downloaded corpus is incorrect.")

    # Extract the images.
    zf = zipfile.ZipFile("corpus.zip", 'r')
    zf.extractall()
    zf.close()

    # Clean up the directory structure.
    for f in os.listdir("OBJECTSALL"):
        shutil.move(
            os.path.join("OBJECTSALL", f),
            os.path.join("objects", f)
        )

    os.remove("corpus.zip")
    os.remove(os.path.join("objects", "Thumbs.db"))
    shutil.rmtree("__MACOSX")
    shutil.rmtree("OBJECTSALL")

    # Rename the images.
    for i, f in enumerate(os.listdir("objects")):
        if f.endswith((".jpg", ".JPG")):
            new_f = "{i}.jpg".format(i=i).zfill(4 + 4)
            os.rename(
                os.path.join("objects", f),
                os.path.join("objects", new_f)
            )


class Object(object):
    """Photgraph of an object."""
    def __init__(self, path):
        super(Object, self).__init__()
        self.path = path

    @property
    def base64(self):
        """Load an image."""
        with open(os.path.join(object_dir, self.path), "rb") as f:
            return b64encode(f.read())

    @property
    def data_uri(self):
        return "data:image/jpeg;base64,{}".format(self.base64)
