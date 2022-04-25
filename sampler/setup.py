from setuptools import setup
from torch.utils.cpp_extension import BuildExtension, CUDAExtension

extra_compile_flags = {}
gencodes = ['-arch=sm_86', '-gencode', 'arch=compute_86,code=sm_86']

extra_compile_flags['nvcc'] = gencodes

setup(
    name='corr_sampler',
    ext_modules=[
        CUDAExtension('corr_sampler', [
            'sampler.cpp', 'sampler_kernel.cu',
        ],
      extra_compile_args=extra_compile_flags)
    ],
    cmdclass={
        'build_ext': BuildExtension
    }
)

