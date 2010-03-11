---
title: Haml, Sass, and Github Pages
layout: post
---

I'd been considering a professional blog for some time, but really had no idea about what to write in it. Regardless of what my
friends may think, I do consider myself only a mediocre programmer, and the few technical accomplishments I had were too few
and far between to consider a blog with any sort of reasonable update frequency. However, with the upcoming release of Rails 3,
a budding interest in JavaScript through [CoffeeScript](http://jashkenas.github.com/coffee-script/) and [Node.js](http://nodejs.org/),
and an increasingly-interesting learning experience in my Scientific Computing course, I decided to bite the bullet, as it were.

It's been quite an interesting experience getting set up here at [Github Pages](http://pages.github.com/). Between learning the 
ins and outs of [Jekyll](http://github.com/mojombo/jekyll) and [Markdown](http://daringfireball.net/projects/markdown/), the 
vagaries of basic page design and CSS, and dusting off my Ruby and Makefile chops for my pre-commit Haml/Sass script, I feel as 
though I've dabbled in quite a bit of everything. For my inaugural post, however, I thought I'd detail my Haml/Sass build process 
for establishing this site.

Ever since I first laid eyes on [Haml](http://haml-lang.com/), I was pretty much hooked. I was learning Python on the side at
the time, and the simple, whitespace-delimited syntax appealed to me in a way that, frankly, ERB and HTML never did. Simplicity
for simplicity's sake, so to speak. I began to convert what Rails projects I had going at the time to it, and did run into one
or two icky issues at the time with nested partials, but I found some hackish way to work around it at the time. Sadly, I no
longer have that old source due to hard drive failure, (always make backups!) and I've lost the time I used to have for side 
projects, but I'm sure I'll rediscover the magic once Rails 3 is finally released and I get a little more free time.

There was only one tiny problem in my way: Github's version of Jekyll, being standard, doesn't support Haml and Sass out of the
box. Facing going back to HTML tag soup, I did what any reasonable developer would do: make the tools work anyway.

The first problem I thought of was one of synchronization. Out of necessity, obviousness, (and an increasing reliance) I must 
use [git](http://git-scm.com/) to manage this blog. Big deal, right? My issue is that it's hard to ignore my muscle memory of 
'git add .' quickly followed by 'git commit'. If I just commit changes to my Haml templates, nothing is going to change 
server-side. I instantly decided on a pre-commit hook. For those unfamiliar, git allows you to define 
[hooks](http://www.kernel.org/pub/software/scm/git/docs/githooks.html) that execute at certain times during your workflow. I
wanted my script to make sure I had already compiled my Haml and Sass templates into HTML/CSS, respectively, before the commit
would be allowed to go through. My quickly-hacked-together script looks a little like the following:

<script src="http://gist.github.com/328293.js?file=gistfile1" type="text/javascript"></script> 

My primary concern was just to show me which HTML/Haml and Sass/CSS files were essentially out of sync with each other. I
don't necessarily want the HTML/CSS generation automated on commit just yet, but I knew I wanted their generation automated.
The thought of going through and piping output for each changed file just shouldn't appeal to anyone, let alone a programmer.
I initially wrote a ruby build script, but its design was somewhat flawed. It would only check the current staging area for
altered Haml/Sass files to compile. The bug didn't even occur to me at first either, leading to a few headaches when trying
to test out a post template. Not relishing the thought of writing a script just to go through my directory structure looking
for altered templates, I racked my brain trying to think of a solution. It hit me approximately three seconds later: a Makefile.

My programming experiences may have begun with BASIC, but C++ is where I came to love it. I toyed around with a Borland compiler
and Dummies book that a coworker of my mother's gave me when I was in 8th grade, and moved to Visual Studio later on, but my
true love was found in gcc. Makefiles proved a natural way to automate my builds, and I found it much faster to simply type 
'make' at a prompt I was at than to make the cognitive shift to press Ctrl+F5, or whatever Visual Studio's 'Build and Go'
shortcut was. That being the case, I had always had fairly small, defined projects. I knew what source files I was compiling,
and my build orders, so I never bothered to learn make's inference rules. A few Googled informative sources later, and I had
a fully-functional Makefile that would auto-compile any changed Haml or Sass template with a simple invocation that has been 
establshed in my muscle memory for some time: 'make'. I now have a completely intuitive build and commit chain for this blog,
and it proved to be quite the learning experience.

<script src="http://gist.github.com/328338.js?file=gistfile1.txt" type="text/javascript"></script>

As for what to write next, I'm sure I'll figure something out. If nothing else I can always talk smack about 
[DHH](http://www.loudthinking.com/) for a few quick pageviews.

