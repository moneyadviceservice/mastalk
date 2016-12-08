# MAStalk [![Build Status](https://travis-ci.org/moneyadviceservice/mastalk.svg)](https://travis-ci.org/moneyadviceservice/mastalk)

The Money Advice Service's Markdown extension language.

## Usage

```
gem install mastalk
```

```
Mastalk::Document.new("markdown").to_html
```

## Components

### Add Action
`.add-action` box

```
^[Help to Buy schemes FAQs](/en/articles/help-to-buy-schemes-faqs)^
```

Outputs:

```
<div class="add-action">
 <p><a href="/en/articles/help-to-buy-schemes-faqs">Help to Buy schemes FAQs</a></p>
</div>
```


### Callout

`.callout`

```
$~callout
# Budgeting tips
In 1985, average first-time buyers needed a deposit of 5% to buy a home - in 2012, this had increased to 20%
*Source: HMS Treasury*
~$
```

Outputs:

```
<div class="callout">
  <h3>Budgeting tips</h3>
  <p>In 1985, average first-time buyers needed a deposit of 5% to buy a home - in 2012, this had increased to 20%
    <br><strong>Source: HM Treasury </strong>
  </p>
</div>
```

### Collapsible header

```
$=
# Before you borrow
=$

$-
Find out if you need to borrow money and whether you can afford it. Learn how to work out the true cost of borrowing.

Taking control of debt

Where to get free debt advice, how to speak to the people you owe money to, and tips to help you pay back your debts in the right order.
-$
```

Outputs:

```
<div class="collapsible is-on">
  <button class="unstyled-button">
    <span class="icon icon--toggle"></span>
    <span class="visually-hidden js-collapsable-hidden">hide </span>
    Before you borrow
  </button>
</div>

<div class="collapsible-section is-on" aria-hidden="false">
  <p>Find out if you need to borrow money and whether you can afford it. Learn how to work out the true cost of borrowing.</p>
  <p>Taking control of debt</p>
  <p>Where to get free debt advice, how to speak to the people you owe money to, and tips to help you pay back your debts in the right order.</p>
</div>

```

### Ticks

```
$yes-no
[y] You should do this [/y]
[y] and then do this [/y]
[y] and finally this [/y]
[n] You should not do this [/n]
[n] or this [/n]
[n] and definitely not do this [/n]
$end
```

Outputs:

```
<ul class="yes-no">
  <li class="yes">You should do this</li>
  <li class="yes">and then do this</li>
  <li class="yes">and finally this</li>
  <li class="no">You should not do this</li>
  <li class="no">or this</li>
  <li class="no">and definitely not do this</li>
</ul>
```

### Bullets (inside tables)

```
$bullet
[%] You should do this [/%]
[%] and then do this [/%]
[%] and finally this [/%]
$point
```

Outputs:

```
<ul>
  <li>You should do this</li>
  <li>and then do this</li>
  <li>and finally this</li>
</ul>
```

### Video

`.video-wrapper`

Embedding a YouTube video:

```
$~youtube_video
  5n1nixLSrQI
~$

```
Outputs:

```
<iframe
  frameborder="0"
  height="413"
  width="680"
  src= "https://www.youtube.com/embed/5n1nixLSrQI"
  title="Video">
</iframe>
```

Or with a custom title:

```
$~youtube_video
  5n1nixLSrQI
  The title of this video
~$

```
Outputs:

```
<iframe
  frameborder="0"
  height="413"
  width="680"
  src= "https://www.youtube.com/embed/5n1nixLSrQI"
  title="The title of this video">
</iframe>
```

Alternatively there is also this legacy format (just here for backward
compatibility):

```
({5n1nixLSrQI})
```

Outputs:

```
<iframe
  frameborder="0"
  height="413"
  width="680"
  src= "https://www.youtube.com/embed/5n1nixLSrQI"
  title="Video">
</iframe>
```

Embedding a Brightcove video:

```
$~brightcove_video
  3739688349001
~$
```

Outputs:

```
<iframe src='//players.brightcove.net/3608769895001/b15c0e6a-51da-4bb1-b717-bccae778670d_default/index.html?videoId=3739688349001'
  frameBorder="0"
  allowfullscreen=""
  webkitallowfullscreen=""
  mozallowfullscreen=""
  height="413"
  width="680" >
</iframe>
```

Or with a custom title:

```
$~brightcove_video
  3739688349001
  The title of this video
~$
```

Outputs:

```
<iframe src='//players.brightcove.net/3608769895001/b15c0e6a-51da-4bb1-b717-bccae778670d_default/index.html?videoId=3739688349001'
  title="The title of this video"
  frameBorder="0"
  allowfullscreen=""
  webkitallowfullscreen=""
  mozallowfullscreen=""
  height="413"
  width="680" >
</iframe>
```

Embedding a Vimeo video:

```
$~vimeo_video
  146226360
~$
```

Outputs:

```
<iframe src="https://player.vimeo.com/video/146226360?portrait=0&title=0&byline=0"
  frameborder="0"
  webkitallowfullscreen
  mozallowfullscreen
  allowfullscreen>
</iframe>
```

Or with a custom title:

```
$~vimeo_video
  146226360
  The title of this video
~$

```
Outputs:

```
<iframe src="https://player.vimeo.com/video/146226360?portrait=0&title=0&byline=0"
  title="The title of this video"
  frameborder="0"
  webkitallowfullscreen
  mozallowfullscreen
  allowfullscreen>
</iframe>
```

### Action Item

`.action-item`

```
$action
## Header
$collapsable
$why
  ### Why?
  Your 'Cash ISA allowance
$why
$how
  ### How?
  If you already have an ISA
$how
$collapsable
$item
```

Outputs:
```
<div class="action-item">
  <h2 id="header" role="heading" aria-level="2">Header</h2>
  <div class="collapsable">
    <div class="why">
      <h3 id="why" role="heading" aria-level="3">Why?</h3>
      <p>Your ‘Cash ISA allowance</p>
    </div>
    <div class="how">
      <h3 id="how" role="heading" aria-level="3">How?</h3>
      <p>If you already have an ISA</p>
    </div>
  </div>
</div>
```

### Line break

```
@~
```

Outputs:
```
<br />
```

### Block

Creates a simple two column layout with content `$bl_c` on one side and `$bl_m` opposite.

* `$bl_c` is intended to contain content of any type.
* `$bl_m` is intended to contain images, i.e. `![Alt text](img.gif)`, or video, i.e. `({5n1nixLSrQI})` or `(@3739688349001@)`.


```
$bl

$bl_c

bl_c$

$bl_m

bl_m$

bl$
```

Outputs:

```
<div class="l-block">
  <div class="l-block__content">
    <div class="panel panel--block"></div>
  </div>
  <div class="l-block__media"></div>
</div>
```

`$bl_c` `$bl_m` positioning can be swapped around to switch element positions.

### Profiling Mastalk

Inside of the project you can run:

```
ruby -Ilib ./bin/mastalk-profiling
```

This command will generate different types of graphs and the ruby stack
for you investigate possible bottlenecks on performance.

### Benchmarking Mastalk

Inside of the project you can run:

```
ruby -Ilib ./bin/mastalk-benchmarking
```

This command will print different benchmarking for Mastalk when parsing
10, 100, 200 and 500 documents.
