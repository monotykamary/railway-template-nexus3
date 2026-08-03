#!/usr/bin/env python3
import os,requests,uuid
b=os.environ['BASE_URL'].rstrip('/');pw=os.environ['ADMIN_PASSWORD'];status=requests.get(b+'/service/rest/v1/status',timeout=60);assert status.status_code==200
blocked=requests.get(b+'/service/rest/v1/security/users',timeout=30);assert blocked.status_code in (401,403)
bad=requests.get(b+'/service/rest/v1/repositories',auth=('admin','wrong'),timeout=30);assert bad.status_code in (401,403)
good=requests.get(b+'/service/rest/v1/repositories',auth=('admin',pw),timeout=30);assert good.status_code==200
disclaimer='Use of Sonatype Nexus Repository - Community Edition is governed by the End User License Agreement at https://links.sonatype.com/products/nxrm/ce-eula. By returning the value from ‘accepted:false’ to ‘accepted:true’, you acknowledge that you have read and agree to the End User License Agreement at https://links.sonatype.com/products/nxrm/ce-eula.'
eula=requests.post(b+'/service/rest/v1/system/eula',auth=('admin',pw),json={'accepted':True,'disclaimer':disclaimer},timeout=30);assert eula.status_code in (204,400),eula.text
name='railway-'+uuid.uuid4().hex[:10];payload={'name':name,'online':True,'storage':{'blobStoreName':'default','strictContentTypeValidation':True,'writePolicy':'ALLOW_ONCE'},'cleanup':None,'component':{'proprietaryComponents':False},'raw':{'contentDisposition':'ATTACHMENT'}};r=requests.post(b+'/service/rest/v1/repositories/raw/hosted',auth=('admin',pw),json=payload,timeout=60);assert r.status_code==201,r.text
content=b'Nexus Railway artifact probe';u=b+'/repository/'+name+'/probe.txt';put=requests.put(u,auth=('admin',pw),data=content,headers={'Content-Type':'text/plain'},timeout=60);assert put.status_code in (200,201,204),put.text;get=requests.get(u,auth=('admin',pw),timeout=30);assert get.status_code==200 and get.content==content
print('Nexus smoke checks passed',name)
