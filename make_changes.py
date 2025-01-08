"""This file changes the html as per the style sheet."""

from os import PathLike, listdir, path
from typing import List

import yaml
from bs4 import BeautifulSoup

SOURCE_DIR = "."
YAML_EXTENSION = "CV.yaml"
HTML_EXTENSION = ".html"
WRITE_HTML = f"index{HTML_EXTENSION}"
RESUME_DIR = path.join(SOURCE_DIR, "resume")


def get_files(lookup_dir: str, extension: str) -> List[str]:
    return [file for file in listdir(path=lookup_dir) if file.endswith(extension)]


def read_file(file_path: str | PathLike) -> str:
    with open(file=file_path, encoding="utf-8", mode="r") as file_stream:
        read_out = file_stream.read()
    return read_out


def get_option(file_stream: str, option: List[str]) -> str:
    yaml_in = yaml.safe_load(stream=file_stream)
    current = yaml_in
    for key in option:
        current = current.get(key)
    return current


def write_html(file_stream: str, option: str, value: str):
    soup = BeautifulSoup(file_stream, features="html.parser")

    cross_origin_tags = soup.find_all(name=option, crossorigin="anonymous")
    cross_origin_tags.extend(soup.find_all(name="script", crossorigin="anonymous"))

    for tag in cross_origin_tags:
        tag.decompose()

    head_tag = soup.head

    link_tag = soup.new_tag(name=option)

    link_tag["rel"] = "stylesheet"

    link_tag["href"] = value

    head_tag.append(tag=link_tag)

    with open(file=WRITE_HTML, encoding="utf-8", mode="w") as file_stream:
        file_stream.write(str(object=soup))


def main():
    html_files = get_files(lookup_dir=RESUME_DIR, extension=HTML_EXTENSION)

    html_read_path = path.join(RESUME_DIR, html_files[0])

    html_read_out = read_file(file_path=html_read_path)

    write_html(file_stream=html_read_out, option="link", value="resume_stylesheet.css")


if __name__ == "__main__":
    main()
