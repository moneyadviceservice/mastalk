# MAStalk

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
$=callout
# Budgeting tips
In 1985, average first-time buyers needed a deposit of 5% to buy a home - in 2012, this had increased to 20%
*Source: HMS Treasury*
=$
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
[y] You should do this
[y] and then do this
[y] and finally this
[n] You should not do this
[n] or this
[n] and definitely not do this
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

### Video

`.video-wrapper`

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

