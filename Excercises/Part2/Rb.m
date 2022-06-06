function pout = Rb(pin, psi, theta, phi)

rbi = [cos(psi)*cos(theta), cos(psi)*sin(theta)*sin(phi) - sin(psi)*cos(phi), sin(psi)*sin(phi) + cos(psi)*sin(theta)*cos(phi)
    sin(psi)*cos(theta), cos(psi)*cos(phi) + sin(psi)*sin(theta)*sin(phi), sin(psi)*sin(theta)*sin(phi) - cos(psi)*sin(phi)
    -sin(theta), cos(theta)*sin(phi), cos(theta)*cos(phi)];

pout = rbi*pin;
end

