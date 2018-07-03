function out = metodo_newton(f,x0, eps)
      
    delta = abs(x0);
    xn = x0;
    
    while delta > eps    
        derivada_em_xn = f(xn);
        primitiva=CotesSimpson13(f,0,xn,1,eps,0);
        x_n_mais_1 = xn-(primitiva-0.45)/derivada_em_xn;
        %derivada_em_xn = (f(xn+delta_derivada)-f(xn))/delta_derivada;
        %x_n_mais_1 = xn - (f(xn)/derivada_em_xn);
        delta = abs(x_n_mais_1-xn)
        xn = x_n_mais_1        
    end
    out = xn
    
end