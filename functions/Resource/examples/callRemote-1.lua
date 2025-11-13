[php]
include( "mta_sdk.php" );
$input = mta::getInput();
mta::doReturn($input[0] + $input[1]);