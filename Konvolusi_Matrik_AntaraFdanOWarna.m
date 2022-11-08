clear;
K = 6;
F = ones(K,K)/(K*K);
K1 = (K+1)/2;
I = imread('kelinci.jpeg');
figure(1), imshow(I);
[N,M,L]=size(I);
Citra = zeros(N+K-1, M+K-1, L);
Citra(K1:N+K1-1, K1:M+K1-1, :)=I(:,:,:)
for p = 1 : L
    for n = K1 : N+K1-1
        for m = K1 : M+K1-1
            konv = 0;
            for l = 1 : K
                for k = 1 : K
                konv = konv + (F(l,k) * Citra(n+1-K1,m+k-K1, p));
                end
            end
            Citra_konv(n-K1+1,m-K1+1,p) = konv;
        end
    end
end
figure(2), imshow(uint8(Citra_konv));