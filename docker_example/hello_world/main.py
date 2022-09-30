'''
Hello world
'''

# %%
import numpy as np

from docker_example.locations import data_dir


# %%
def main():
    y = np.random.uniform()
    print(data_dir, y)


# %%
if __name__ == '__main__':
    main()
