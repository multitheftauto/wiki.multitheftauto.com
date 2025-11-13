[html]
<html>
   <head>
      <* = call ( getResourceFromName("ajax"), "start", getResourceName(getThisResource()) ) *>
   </head>
   <body>
      <b>Random quote:</b> <* httpWrite( call ( getThisResource(), "getRandomQuote" ) ) *>
   </body>
</html>