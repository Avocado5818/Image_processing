function out = integration_JNB(image)
    G0=image;
    G1 = imgaussfilt(image, 0.4);
    G2 = imgaussfilt(image, 0.8);
    G3 = imgaussfilt(image, 1.2);
    G4 = imgaussfilt(image, 1.6);
    G5 = imgaussfilt(image, 2.0);
    G6 = imgaussfilt(image, 2.4);
    G7 = imgaussfilt(image, 2.8);
    G8 = imgaussfilt(image, 3.2);
    G9 = imgaussfilt(image, 3.6);
    G10 = imgaussfilt(image, 4.0);
    
    J0 = JNBM_compute(uint8(G0));
    J1 = JNBM_compute(uint8(G1));
    J2 = JNBM_compute(uint8(G2));
    J3 = JNBM_compute(uint8(G3));
    J4 = JNBM_compute(uint8(G4));
    J5 = JNBM_compute(uint8(G5));
    J6 = JNBM_compute(uint8(G6));
    J7 = JNBM_compute(uint8(G7));
    J8 = JNBM_compute(uint8(G8));
    J9 = JNBM_compute(uint8(G9));
    J10 = JNBM_compute(uint8(G10));
    
out = [J0,J1,J2,J3,J4,J5,J6,J7,J8,J9,J10];
end