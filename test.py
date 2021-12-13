import rados
import sys

cluster = rados.Rados(conffile='ceph.conf')
print("\nlibrados version: {}".format(str(cluster.version())))
print("Will attempt to connect to: {}".format(str(cluster.conf_get('mon host'))))

cluster.connect()
print("\nCluster ID: {}".format(cluster.get_fsid()))
print("\n\nCluster Statistics")
print("==================")
cluster_stats = cluster.get_cluster_stats()
for key, value in cluster_stats.items():
    print(key, value)
print("\n\nPool Operations")
print("===============")

print("\nAvailable Pools")
print("----------------")
pools = cluster.list_pools()

for pool in pools:
    print(pool)
print("Create 'test' Pool")
cluster.create_pool('test')

print("\nPool named 'test' exists: {}".format(str(cluster.pool_exists('test'))))
print("\nVerify 'test' Pool Exists")
print("-------------------------")
pools = cluster.list_pools()

for pool in pools:
    print(pool)

print("\nDelete 'test' Pool")
print("------------------")
cluster.delete_pool('test')
print("\nPool named 'test' exists: {}".format(str(cluster.pool_exists('test'))))

