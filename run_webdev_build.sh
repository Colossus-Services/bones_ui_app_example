#!/bin/bash

HELP=0

if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
  HELP=1
fi

if [ "$HELP" == "0" ]; then
  dart pub global activate webdev
fi

export PATH="$PATH":"$HOME/.pub-cache/bin"


if [ "$HELP" == "0" ] ; then

  webdev build $@

else

  webdev serve $@

  echo ""
  echo "PARAMETERS EXAMPLES:"
  echo ""
  echo ""
  echo "  ## Compile in release mode (optimized JS):"
  echo "    --release"
  echo "    ## or:"
  echo "    -r"
  echo ""
  echo "  ## Force Null Safety:"
  echo "    --null-safety sound"
  echo ""
  echo "  ## Disable Null Safety:"
  echo "    --null-safety unsound"
  echo ""

fi
