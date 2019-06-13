import os

if __name__ == '__main__':
  path = r'D:\sz下载'
  dir_list = []
  for d in os.listdir(path):
    dir_list.append(os.path.join(path,d))
  q = sorted(dir_list, key=lambda d:os.stat(d).st_ctime, reverse=True)
  print(q)
  n = 0
  for temp in q:
    n += 1
    if n > 7:
       # print(temp)
       os.rmdir(temp)