<p>These queries can be <strong>chained</strong> together just by adding another one on the end:<br>
      <code>DT[...][...]</code><br>
See <strong>data.table compared to dplyr</strong> on <a href="http://stackoverflow.com/questions/21435339/data-table-vs-dplyr-can-one-do-something-well-the-other-cant-or-does-poorly">Stack Overflow</a> and <a href="https://www.quora.com/Which-is-better-to-use-for-data-manipulation-dplyr-package-or-data-table-library">Quora</a>.</p>
<p>Other features include :</p>
<ul>
<li>
<strong>fast and friendly (now parallelized in <a href="https://github.com/Rdatatable/data.table/wiki/Installation">dev</a>) delimited file reader</strong>: <a href="http://www.rdocumentation.org/packages/data.table/functions/fread"><code>?fread</code></a>. It accepts system commands directly (such as <code>grep</code> and <code>gunzip</code>) and other <a href="https://github.com/Rdatatable/data.table/wiki/Convenience-features-of-fread">convenience features for <em>small</em> data</a>.</li>
<li>
<strong>fast and parallelized file writer</strong>: <a href="http://www.rdocumentation.org/packages/data.table/functions/fwrite"><code>?fwrite</code></a> announced <a href="http://blog.h2o.ai/2016/04/fast-csv-writing-for-r/">here</a> and on CRAN in Nov 2016.</li>
<li>
<strong>parallelized row subsets</strong> - See <a href="https://github.com/Rdatatable/data.table/issues/1660#issuecomment-212142342">this benchmark for timings</a>
</li>
<li>fast <strong>aggregation</strong> of large data; e.g. 100GB in RAM (see <a class="internal present" href="/Rdatatable/data.table/wiki/Benchmarks-%3A-Grouping">benchmarks</a> on up to <strong>two billion rows</strong>)</li>
<li>fast add/update/delete columns <strong>by reference</strong> by group using no copies at all</li>
<li>fast <strong>ordered joins</strong>; e.g. rolling forwards, backwards, nearest and limited staleness</li>
<li>fast <strong><a href="wiki/talks/EARL2014_OverlapRangeJoin_Arun.pdf">overlapping range joins</a></strong>; similar to <code>findOverlaps</code> function from IRanges/GenomicRanges Bioconductor packages, but not limited to genomic (integer) intervals.</li>
<li>fast <strong>non-equi</strong> (or conditional) joins, i.e., joins using operators <code>&gt;, &gt;=, &lt;, &lt;=</code> as well, available from v1.9.8+</li>
<li>a fast <strong>primary ordered index</strong>; e.g. <code>setkey(DT,col1,col2)</code>
</li>
<li>
<strong>automatic secondary indexing</strong>; e.g. <code>DT[col==val,]</code> and <code>DT[col %in% vals,]</code>
</li>
<li>fast and memory efficient combined join and group by; <strong><code>by=.EACHI</code></strong>
</li>
<li>fast reshape2 methods (<strong>dcast</strong> and <strong>melt</strong>) without needing reshape2 and its dependency chain installed or loaded</li>
<li>group summary results may be many rows (e.g. <strong>first and last row by group</strong>) and each cell value may itself be a vector/object/function (e.g. <strong>unique ids by group as a list column of varying length vectors</strong> - this is pretty printed with commas)</li>
<li>special symbols built-in for convenience and raw speed by avoiding the overhead of function calls: <strong><a href="https://www.rdocumentation.org/packages/data.table/versions/1.10.0/topics/special-symbols"><code>.N</code>, <code>.SD</code>, <code>.I</code>, <code>.GRP</code> and <code>.BY</code></a></strong>
</li>
<li>
<strong>any R function from any R package</strong> can be used in queries not just the subset of functions made available by a database backend</li>
<li>has <strong><a href="https://en.wikipedia.org/wiki/Dependency_hell">no dependencies</a></strong> at all other than base R itself, for simpler production/maintenance</li>
<li>the R dependency is <strong>as old as possible for as long as possible</strong> and we test against that version; e.g., v1.9.8 released on 25-Nov-2016 bumped the dependency up from 4.5 year old R 2.14.0 to 3 year old R 3.0.0.</li>
</ul>
