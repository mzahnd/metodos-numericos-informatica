## Copyright (C) 2021
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} horner (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <seabmo@wolf>
## Created: 2021-08-12

function retval = horner (x, degree, coefficients)
  if length(coefficients) != degree + 1
    disp("Invalid coefficients or degree provided")
    return;
  elseif degree < 0
    disp("Degree must be >= 0")
    return;
  endif
  
  retval = 0;
  b = 0;
  
  if degree == 0
    retval = coefficients(1);
    return;
  endif
  
  while degree > 0
    b = coefficients(2) + coefficients(1) * x;
    coefficients = [b, coefficients([3:end])];
    degree--;
  endwhile
  
  retval = b;
endfunction
