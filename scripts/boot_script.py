#!/usr/bin/env python3
import requests

def get_metadata_value(key):
    """
    Fetch the key from the metadata server
    """
    url = 'http://metadata/computeMetadata/v1/instance/' + key
    headers = {'content-type': 'application/json', 'Metadata-Flavor': 'Google'}
    r = requests.get(url, headers=headers)
    return r.text

private_ip = get_metadata_value("name")
api_port = get_metadata_value("name")
pod_cidr = get_metadata_value("name")
service_cidr = get_metadata_value("name")
loadbalancer_ip = get_metadata_value("name")
cluster_name = get_metadata_value("name")
node_name = get_metadata_value("name")

filename_input = "/tmp/kubeadm.conf.template"
filename_output = "/tmp/kubeadm.conf"

with open(filename_input, 'r') as file :
  filedata = file.read()

filedata = filedata.replace('##private_ip##', private_ip)
filedata = filedata.replace('##api_port##', api_port)
filedata = filedata.replace('##pod_cidr##', pod_cidr)
filedata = filedata.replace('##service_cidr##', service_cidr)
filedata = filedata.replace('##loadbalancer_ip##', loadbalancer_ip)
filedata = filedata.replace('##cluster_name##', cluster_name)
filedata = filedata.replace('##node_name##', node_name)

with open(filename_output, 'w') as file:
  file.write(filedata)