function out = integration_CPBD(image)

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
    
    C0 = CPBD_compute(uint8(G0));
    C1 = CPBD_compute(uint8(G1));
    C2 = CPBD_compute(uint8(G2));
    C3 = CPBD_compute(uint8(G3));
    C4 = CPBD_compute(uint8(G4));
    C5 = CPBD_compute(uint8(G5));
    C6 = CPBD_compute(uint8(G6));
    C7 = CPBD_compute(uint8(G7));
    C8 = CPBD_compute(uint8(G8));
    C9 = CPBD_compute(uint8(G9));
    C10 = CPBD_compute(uint8(G10));
    
out= [C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10];
end