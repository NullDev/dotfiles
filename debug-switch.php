<?php
  /**
   * Debug
   * @param {int} 1 : 0
   */
  $s_debug = 1;
  switch ($s_debug) {
    case 0: {
      error_reporting(0);
      ini_set('display_errors', 'Off');
      set_error_handler(null);
      break;
    }
    case 1: {
      error_reporting(-1);
      ini_set('display_errors', 'On');
      set_error_handler("var_dump");
      break;
    }
    default: break;
  }
?>
