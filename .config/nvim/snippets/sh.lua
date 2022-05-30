return {
  -- function
  s('fn', fmt([[
    function {}() {{
    {}{}
    }}
  ]], {i(1), t('\t'), i(2)})),

  -- if statement
  s('if', fmt([=[
  if [[ {} ]]; then
  {}{}
  fi
  ]=], {i(1), t('\t'), i(2)})
  ),
}
