const verifyToken = r'''
query {
  verifyToken(token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1OTk4ODY3ODAsInVzZXIiOnsiaWQiOiJmNTFhZDI3ZC1hY2JmLTQ2ZWItOWJjOC1jNjAwZWYwNDE5YWYiLCJyb2xlIjoiYnVzaW5lc3MifX0.RNiN8RF628RiL_O6qY-MjpdKNXtd-2Y2XDRq2BD4qWI")
}
''';