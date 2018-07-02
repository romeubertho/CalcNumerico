function out = metodo_newton(f,x0, eps)
    
    delta_derivada = exp(-10);    
    delta = abs(x0)
    xn = x0

    while delta > eps    
        derivada_em_xn = (f(xn+delta_derivada)-f(xn))/delta_derivada
        x_n_mais_1 = xn - (f(xn)/derivada_em_xn)
        delta = abs(x_n_mais_1-xn);
        xn = x_n_mais_1;        
    end
    out = xn
end