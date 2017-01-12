<pre><code>
Sys.time()
## print with possibly greater accuracy:
op <- options(digits.secs = 6)
Sys.time()
options(op)
</code></pre>
<!-- ############################################################################################################ -->
<pre><code>
## locale-specific version of date()
format(Sys.time(), "%a %b %d %X %Y")

Sys.Date()

</code></pre>
