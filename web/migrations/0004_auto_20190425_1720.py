# Generated by Django 2.1.4 on 2019-04-25 17:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0003_auto_20190425_1716'),
    ]

    operations = [
        migrations.AlterField(
            model_name='script',
            name='interpreter',
            field=models.CharField(choices=[('sh', 'bash'), ('py', 'python3')], default='py', max_length=16, verbose_name='解释器'),
        ),
    ]