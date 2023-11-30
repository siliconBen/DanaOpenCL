__constant sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_NONE | CLK_FILTER_NEAREST;

__kernel void floatDiv(__global unsigned int* divider, read_only image2d_t matrix, write_only image2d_t matrix_write) {
    int gidx = get_global_id(0);
    int gidy = get_global_id(1);
    
    float4 fromDevice = read_imagef(matrix, sampler, (int2)(gidx, gidy));
    float ourNumber = fromDevice[0];
    float divided = ourNumber / divider[0];
    if (divided != 0.0) {
        printf("%d | %f\n", gidx, divided);
    }

    write_imagef(matrix_write, (int2)(gidx, gidy), (float4)(divided, 0 ,0 ,0));
}
