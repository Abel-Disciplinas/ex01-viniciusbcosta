# add Images
# add ImageMagick

using Images

# z^2 = x^2 + 2xyi - y^2 = (x^2 - y^2) + (2xy) i
function iteracao_mandelbrot(cx, cy; max_iter=40)
  x_re = y_im = 0 
# x_re será a parte real e y_im a imaginária
  for iter = 0:40
    a,b = x,y
    x_re = a^2 - b^2 + cx
    y_im = 2*a*b + cy
  end

  if (x_re^2) + (y_im^2) < 4
    return false, 0
  else
    return true, 1
  end
end

function mandelbrot(N)
  x = range(-2.5, 1.5, length=N)
  y = range(-2.0, 2.0, length=N)

  imagem = zeros(N, N)
  for i = 1:N
    for j = 1:N
      estavel, ρ = iteracao_mandelbrot(x[i], y[j])
      if estavel
        imagem[i,j] = ρ
      end
    end
  end

  save("mandelbrot.jpg", imagem')
end

mandelbrot(1000)
