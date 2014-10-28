# MAStalk

The Money Advice Service's Markdown extension language.

## Components

### Action
`.add-action` box

```
^[Help to Buy schemes FAQs](/en/articles/help-to-buy-schemes-faqs)^
```

Outputs:

```
<div class="add-action">
  <a href="/en/articles/help-to-buy-schemes-faqs">Help to Buy schemes FAQs</a>
</div>
```

### Table

`.datatable-default`

```
$=table

{caption} Budget for the other costs of buying a home

| Equity loans            | Mortgage guarantees
|---                      |---
| New-build properties    | New-build and pre-owned properties
| Minimum 5% deposit      | Minimum 5% deposit
|===                      |===
| April 2013              |

=$
```

Outputs:

```
<table class="datatable-default">
  <thead>
  <tr>
    <th>Heading</th>
    <th>Heading 2</th>
  </tr>
  </thead>

  <tbody>
  <tr>
    <td>&nbsp;Equity loans</td>
    <td>&nbsp;Mortgage guarantees</td>
  </tr>
  <tr>
    <td><a title="News index" href="https://www.moneyadviceservice.org.uk/en/news">New-build properties</a></td>
    <td><a title="BBC News site" target="_blank" href="http://www.bbc.co.uk/news/business/your_money/">New-build and
      pre-owned properties</a></td>
  </tr>
  <tr>
    <td>&nbsp;Minimum 5% deposit</td>
    <td>&nbsp;Minimum 5% deposit</td>
  </tr>
  </tbody>
</table>
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

### Collapsible

```
$=collapsible

# Before you borrow

Find out if you need to borrow money and whether you can afford it. Learn how to work out the true cost of borrowing.

# Taking control of debt

Where to get free debt advice, how to speak to the people you owe money to, and tips to help you pay back your debts in the right order.

=$
```

Outputs:

**[TBC]**

### Benefits

```
[y] You should do this
[y] and then do this
[y] and finally this
[n] You should not do this
[n] or this
[n] and definitely not do this
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
({300422})

```

Outputs:

```
<video
    data-account="57838016001"
    data-player="c5049c84-4364-47bc-a169-53886c6d7fcd"
    data-embed="default"
    data-id="300422"
    class="video-js" controls>
</video>
```

### Action Item

`.action-item`

**Requirements TBC**

### Horizontal rule
```
---
```

Outputs:

```
<hr>
```
