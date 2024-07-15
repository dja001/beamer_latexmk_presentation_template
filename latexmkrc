$preview_continuous_mode = 1;

$pdf_mode = 1 ;
$pdf_previewer = "xreader" ; 
$dvipdf = "dvipdfm %O -o %D %S" ; 

$latex = 'latex -interaction=nonstopmode -shell-escape';
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape';

add_cus_dep( 'svg', 'pdf', 0, 'svg2pdf' );
add_cus_dep( 'png', 'pdf', 0, 'png2pdf' );

sub svg2pdf {
     system( "inkscape \"$_[0].svg\" --export-area-page --export-type=pdf --export-filename=\"$_[0].pdf\"" );
}

sub png2pdf {
     system( "inkscape \"$_[0].png\" --export-area-page --export-type=pdf --export-filename=\"$_[0].pdf\"" );
}
