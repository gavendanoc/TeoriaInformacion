function y = f (x)
  y = x .* sin (1./x) .* sqrt (abs (1 - x));
endfunction