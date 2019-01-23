from django.template import Library
from django.urls import reverse
from django.http import QueryDict

register = Library()


@register.simple_tag
def memory_url(request, name, *args, **kwargs):
    """
    生成URL（含条件）
    :return:
    """
    base_url = reverse(name, args=args, kwargs=kwargs)
    if not request.GET:  # 如果获取不到url后面的参数，就返回基本的url
        return base_url
    # 实例化一个参数，QueryDict就是负责把多个参数转换成一个参数的
    new_query_dict = QueryDict(mutable=True)
    # 这个是把url后面的多个参数转换成了一个参数，request.GET.urlencode() 是获取url后面的参数
    new_query_dict['_filter'] = request.GET.urlencode()  # _filter=pagesdf5sdfagesdfsdf1
    url = "%s?%s" % (base_url, new_query_dict.urlencode(),)  # 最后返回url+后面携带的参数
    return url


@register.simple_tag
def deploy_status(host_id, deployed_host_dict):
    deploy_record_object = deployed_host_dict.get(host_id)  # 根据hostID
    if not deploy_record_object:
        return '未发布'
    else:
        return deploy_record_object.get_status_display()


@register.simple_tag
def rollback_status(host_id, deployed_host_dict):
    roll_record_object = deployed_host_dict.get(host_id)  # 根据hostID
    if not roll_record_object:
        return '未回滚'
    else:
        return roll_record_object.get_status_display()


@register.simple_tag
def host_version(host_id, deployed_host_dict):
    deploy_record_object = deployed_host_dict.get(host_id)

    if not deploy_record_object:
        return '0'
    else:
        return deploy_record_object.host_version


@register.simple_tag
def host_datetime(host_id, deployed_host_dict):
    deploy_record_object = deployed_host_dict.get(host_id)

    if not deploy_record_object:
        return '0'
    else:
        return deploy_record_object.deploy_time.strftime('%Y-%m-%d %H:%M:%S')


@register.simple_tag
def log_info(host_id, deployed_host_dict):
    deploy_record_object = deployed_host_dict.get(host_id)

    if not deploy_record_object:
        return 'null'
    else:
        return deploy_record_object.log


@register.simple_tag
def rollback_log(host_id, deployed_host_dict):
    roll_record_object = deployed_host_dict.get(host_id)  # 根据hostID
    if not roll_record_object:
        return 'null'
    else:
        return roll_record_object.rollback_log
