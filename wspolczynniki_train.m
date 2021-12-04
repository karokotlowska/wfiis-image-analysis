function wsp = wspolczynniki_train()
    ids_c = imageDatastore('dataset/c');    
    ids_d = imageDatastore('dataset/d');
    ids_i = imageDatastore('dataset/i');
    ids_l = imageDatastore('dataset/l');
    ids_m = imageDatastore('dataset/m');
    ids_v = imageDatastore('dataset/v');
    ids_x = imageDatastore('dataset/x');

    wc = wczytaj(ids_c);
    wd = wczytaj(ids_d);
    wi = wczytaj(ids_i);
    wl = wczytaj(ids_l);
    wm = wczytaj(ids_m);
    wv = wczytaj(ids_v);
    wx = wczytaj(ids_x);

    trainin = [wc;wd;wi;wl;wm;wv;wx]';

    trainout = [repmat([1,0,0,0,0,0,0], length_w(wc),1);
    repmat([0,1,0,0,0,0,0], length_w(wd),1);
    repmat([0,0,1,0,0,0,0], length_w(wi),1);
    repmat([0,0,0,1,0,0,0], length_w(wl),1);
    repmat([0,0,0,0,1,0,0], length_w(wm),1);
    repmat([0,0,0,0,0,1,0], length_w(wv),1);
    repmat([0,0,0,0,0,0,1], length_w(wx),1);]';


nn = feedforwardnet(50);
%{
nn.adaptFcn = 'adaptwb';
nn.divideFcn = 'dividerand';
nn.divideMode = 'sample';
nn.layers{1}.transferFcn = 'logsig';
nn.layers{2}.transferFcn = 'tansig';
nn.trainFcn = 'trainlm';
nn.performFcn = 'mse';
%}
nn = train(nn,trainin,trainout);

ocr_final_8_new = nn;
save ocr_final_8_new;
end