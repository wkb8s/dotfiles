#!/usr/bin/env perl

# LaTeX
$latex = 'platex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 5;

# BibTeX
$bibtex = 'pbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# index
$makeindex = 'mendex %O -o %D %S';

# DVI / PDF
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# preview
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    # $pdf_previewer = "open %S";
    # $pdf_previewer = "zathura %O %S";
    $pdf_previewer    = "open -ga /Applications/Skim.app";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

# clean up
# $clean_full_ext = "%R.synctex.gz";
$clean_ext = "dvi aux fls log synctex.gz fdb_latexmk";

# $aux_dir = "aux";

# caution! : if you use relative path, compilation failed
$out_dir = "/Users/wakabayashidaiki/Google Drive/My Drive/pdf";

# # 最大のタイプセット回数
# $max_repeat = 5;
# # DVI経由でPDFをビルドすることを明示
# $pdf_mode = 3;

# # pLaTeXを使う
# # -halt-on-error:初めのエラーで終わらせる
# $latex = 'platex %O %S -halt-on-error';

# # pBibTeXを使う(参考文献)
# $bibtex = 'pbibtex %O %S';

# # Mendexを使う(索引)
# $makeindex = 'mendex %O -o %D %S';

# # DVIからPDFへの変換
# $dvipdf = 'dvipdfmx %O -o %D %S';
