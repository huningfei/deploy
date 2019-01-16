"""
使用文档：
    1. 获取两个数据给Pagination
        - 数据库的数据总数据量
        - 当前要访问的页码
        例如：
            page = request.GET.get('page', 1) # 要查看的页码
            total_count = models.Department.objects.all().count() # 数据库中数据总条数
            pager = Pagination(page,total_count,'/crm/depart/list/')
    2. Pagination对象有两个功能
        - 计算数据切片索引
            例如：
                depart_queryset = models.Department.objects.all()[pager.start :pager.end]
        - 生成页码HTMl
            例如：在页面中使用
                  <ul class="pagination">
                      {{ pager.page_html|safe }}
                  </ul>
"""

class Pagination(object):
    """
    分页相关
    """
    def __init__(self,page,total_count,url, per_page_count=10,max_page_num=11):
        """
        :param page: 当前页
        :param total_count: 数据库中数据总条数
        :param url: 路径
        :param per_page_count: 页面显示的数据条数
        :param max_page_num:  最多显示的页码数量
        """
        try:
            page = int(page)
        except Exception as e:
            page =1
        if page <1:
            page = 1
        self.page = page
        self.total_count = total_count
        self.url = url
        self.per_page_count = per_page_count
        self.max_page_num = max_page_num

        self.half_max_page_num = int(max_page_num / 2)
        self.total_page_num, x = divmod(total_count, per_page_count)
        if x > 0:
            self.total_page_num += 1
    @property
    def start(self):
        return (self.page-1) * self.per_page_count

    @property
    def end(self):
        return self.page * self.per_page_count

    def page_html(self):
        # 如果数据库中的数据最多总共能到11条 10,9,0 < max_page_num
        if self.total_page_num <= self.max_page_num:
            page_start = 1
            page_end = self.total_page_num + 1
        else:
            # 如果当前访问的页码： 1,2,3,4,5
            if self.page <=self.half_max_page_num:
                page_start = 1
                page_end = self.max_page_num + 1
            else:
                # 如果当前页+5 > 总页码
                if self.page + self.half_max_page_num > self.total_page_num:
                    page_start = self.total_page_num - self.max_page_num + 1
                    page_end = self.total_page_num + 1
                else:
                    page_start = self.page - self.half_max_page_num
                    page_end = self.page + self.half_max_page_num + 1
        pager_list = []

        # 上一页
        if self.page > 1:
            prev = '<li><a href="%s?page=%s">上一页</a></li>' % (self.url,self.page - 1,)
            pager_list.append(prev)

        for i in range(page_start, page_end):  # 应该显示一定范围的页码
            if i == self.page:
                temp = '<li class="active"><a href="%s?page=%s">%s</a></li>' % (self.url,i, i,)
            else:
                temp = '<li><a href="%s?page=%s">%s</a></li>' % (self.url,i, i,)
            pager_list.append(temp)

        # 下一页
        if self.page < self.total_page_num:
            nex = '<li><a href="%s?page=%s">下一页</a></li>' % (self.url,self.page + 1,)
            pager_list.append(nex)

        return "".join(pager_list)
