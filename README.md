reactivex.github.io
===================

ReactiveX Website - [Jekyll](http://jekyllrb.com/) + [Bootstrap](http://getbootstrap.com/) experiment

Install tools
--------------

Jekyll is the static site generator. Uglifier, LESS, and Rake are build tools necessary for JavaScript and CSS compilation prior to Jekyll.

```
$ gem install jekyll uglifier rake
$ npm install -g less
```

Run
---

Rake's default task will compile styles the run `jekyll serve`.

```
$ rake
```

Marble diagrams
---------------
The marble diagrams are created in OmniGraffle. The source file is found at the RxJava Wiki (https://github.com/Netflix/RxJava.wiki.git) or can be downloaded here: https://raw.githubusercontent.com/wiki/ReactiveX/RxJava/images/rx-operators.graffle

If you want to make changes to this file, please check it out from the wiki, make changes, and check it back in there.

As of this writing, this OmniGraffle source is used to make two separate copies of the .png marble diagrams: one set hosted at the RxJava wiki which also serves as the source for the images in the javadocs, and one set hosted at this reactivex.github.io site. You have to generate these yourself by using OmniGraffle's "export" feature. If you check in a change that you want to be visible in both places, you'll have to check in the images in both repos.

The OmniGraffle file has grown to be cumbersome, and so there are some false-canvases with names that begin and end with lots of equals signs that are used as separators/headings to make individual diagrams easier to find. When you export the .png images based on this OmniGraffle file, it will also spit out empty .png images for these false-canvases. You'll just have to delete those manually or put them in your .gitignore or something. At least they're easy to spot.
