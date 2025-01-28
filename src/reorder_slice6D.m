function img_out = reorder_slice6D(img, SliceOrder, Ns)
% img is a [Nx,Ny,Nslice,1,1,Necho] image

    img_out = zeros(size(img));
    
    if strcmp(SliceOrder, 'int')
        if mod(Ns, 2) == 0 % even # slice; interleave
            img_out(:,:,1:2:end,:,:,:) = img(:,:,Ns/2+1:end,:,:,:);
            img_out(:,:,2:2:end,:,:,:) = img(:,:,1:Ns/2,:,:,:);
        else % odd # slice; interleave
            img_out(:,:,2:2:end,:,:,:) = img(:,:,ceil(Ns/2+1):end,:,:,:);
            img_out(:,:,1:2:end,:,:,:) = img(:,:,1:ceil(Ns/2+1)-1,:,:,:);
        end
    else
        img_out = img;
    end
end
