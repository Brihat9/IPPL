ffta = [14.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 + 0.0000i  -2.0000 - 2.0000i]
fftb = [-2.0000 + 0.0000i  -2.0000 - 2.0000i  14.0000 + 0.0000i  -2.0000 + 2.0000i]
fftc = [-30.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 + 0.0000i  -2.0000 - 2.0000i]

iffta = ifft(ffta)
ifftb = ifft(fftb)
ifftc = ifft(fftc)
