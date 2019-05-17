---
title: "Additional engines for knitr"
output: 
  html_document:
    keep_md: true
---



# Additional engines for `knitr`

## `glue`

The `glue` engine is useful in programatically writing texts.
As documented in `?glue::glue`,

> Expressions enclosed by braces will be evaluated as R code. Long strings are broken by line and concatenated together. Leading whitespace and blank lines from the first and last lines are automatically trimmed.

For example, let's substitute `{name}` by "Atusy".

First use `r` engine like below.


```r
name <- "Atusy"
```

And then use `glue` engine like below.

````{.text}
```{glue}
**My name is {name}.**
This output is powered by glue package!
```
````

**My name is Atusy.**
This output is powered by glue package!

Nice text!
The output text is rendered as Pandoc's markdown.

Extra arguments of `glue::glue()` can be controlled by specifying `glue.args`.
A following example 
  replaces a expression enclosed by percents (`%` and `%`) 
  instead of default braces (`{` and `}`)

````{.text}
```{glue, glue.args = list(.open = "%", .close = "%")}
**My name is %name%.**
This output is powered by glue package!
```
````

**My name is Atusy.**
This output is powered by glue package!

# `options`

The `options` engine is useful for debugging.
By running a current chunk or by knitting, 
you can see chunk options of a current chunk as a structure of a list.

````{.text}
```{options}
code("options")
```
````


```
## List of 58
##  $ eval         : logi TRUE
##  $ echo         : logi FALSE
##  $ results      : chr "markup"
##  $ tidy         : logi FALSE
##  $ tidy.opts    : NULL
##  $ collapse     : logi FALSE
##  $ prompt       : logi FALSE
##  $ comment      : chr "##"
##  $ highlight    : logi TRUE
##  $ strip.white  : logi TRUE
##  $ size         : chr "normalsize"
##  $ background   : chr "#F7F7F7"
##  $ cache        : num 0
##  $ cache.path   : chr "engines_cache/html/"
##  $ cache.vars   : NULL
##  $ cache.lazy   : logi TRUE
##  $ dependson    : NULL
##  $ autodep      : logi FALSE
##  $ cache.rebuild: logi FALSE
##  $ fig.keep     : chr "high"
##  $ fig.show     : chr "asis"
##  $ fig.align    : chr "default"
##  $ fig.path     : chr "engines_files/figure-html/"
##  $ dev          : chr "png"
##  $ dev.args     : NULL
##  $ dpi          : num 96
##  $ fig.ext      : NULL
##  $ fig.width    : num 7
##  $ fig.height   : num 5
##  $ fig.env      : chr "figure"
##  $ fig.cap      : NULL
##  $ fig.scap     : NULL
##  $ fig.lp       : chr "fig:"
##  $ fig.subcap   : NULL
##  $ fig.pos      : chr ""
##  $ out.width    : NULL
##  $ out.height   : NULL
##  $ out.extra    : NULL
##  $ fig.retina   : num 1
##  $ external     : logi TRUE
##  $ sanitize     : logi FALSE
##  $ interval     : num 1
##  $ aniopts      : chr "controls,loop"
##  $ warning      : logi TRUE
##  $ error        : logi FALSE
##  $ message      : logi TRUE
##  $ render       : NULL
##  $ ref.label    : NULL
##  $ child        : NULL
##  $ engine       : chr "options"
##  $ split        : logi FALSE
##  $ include      : logi TRUE
##  $ purl         : logi TRUE
##  $ label        : chr "options"
##  $ out.width.px : num 672
##  $ out.height.px: num 480
##  $ code         : chr "The content of chunk is ignored."
##  $ params.src   : chr "options, engine=\"options\""
##  - attr(*, "class")= chr "knitr_strict_list"
```

If you only want to output chunk options different from `knitr::opts_chunk$get()`,
specify `options.diff = TRUE` as a chunk option.

````{.text}
```{options, foo = "bar", options.diff = TRUE}

```
````


```
## List of 9
##  $ echo         : logi FALSE
##  $ cache        : num 0
##  $ engine       : chr "options"
##  $ foo          : chr "bar"
##  $ label        : chr "unnamed-chunk-2"
##  $ out.width.px : num 672
##  $ out.height.px: num 480
##  $ code         : chr ""
##  $ params.src   : chr " foo = \"bar\", options.diff = TRUE, engine=\"options\""
```

