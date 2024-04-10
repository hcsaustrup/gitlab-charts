# gitlab-charts

A temporary place to store hotfixed Gitlab charts to facilitate upgrading an ancient installation.

## Fetching original charts

```
./get.sh gitlab 2.5.5
```

## Upgrade paths

* GitLab 12: 12.0.12 > 12.1.17 > 12.10.14
* GitLab 13: 13.0.14 > 13.1.11 > 13.8.8 > 13.12.15
* GitLab 14: 14.0.12 > 14.3.6 > 14.9.5 > 14.10.5
* GitLab 15: 15.0.5 > 15.1.6 (for GitLab instances with multiple web nodes) > 15.4.6 > 15.11.13.
* GitLab 16: 16.0.8 (only instances with lots of users or large pipeline variables history) > 16.1.6 (instances with NPM packages in their package registry) > 16.2.9 (only instances with large pipeline variables history) > 16.3.7 > 16.7.z > latest 16.Y.Z. 

Sources:
* https://archives.docs.gitlab.com/15.11/ee/update/#upgrade-paths
* https://docs.gitlab.com/ee/update/index.html#upgrade-paths
