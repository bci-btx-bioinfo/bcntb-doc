# bcntb-doc.github.io
This GitHub Pages serves the middle layer for [BCNTB Documentation internal repository](https://github.qmul.ac.uk/bci-btx-bioinfo/BCNTB-Documentation).

Website: https://bci-btx-bioinfo.github.io/bcntb-doc/

## Building and previewing this site locally

Assuming [Jekyll] and [Bundler] are installed on your computer:

1.  Change your working directory to the root directory of your site.

2.  Run `bundle install`.

3.  Run `bundle exec jekyll serve --incremental` to build your site and preview it at `localhost:4000`.

    The built site is stored in the directory `_site`.

4. Encrypt the websites using [staticrypt](https://github.com/robinmoisson/staticrypt):
    ```bash
   # Encrypt documentations for index.html
   staticrypt _site/index.html -d _site/ -p "XXXX" --short --template-title "Login" --template-instructions "Please enter the password to unlock the page" --template-button "Open Page" --template-color-primary "#113e9f" --template-color-secondary "#e4e4e4"

    ```

## Publishing your built site on a different platform

Just upload all the files in the directory `_site`.

## Customization

You're free to customize sites that you create with this template, however you like!

[Browse Just the Docs documentation][Just the Docs] to learn more about how to use this theme.

----

[Jekyll]: https://jekyllrb.com
[Just the Docs]: https://just-the-docs.github.io/just-the-docs/
[Bundler]: https://bundler.io
