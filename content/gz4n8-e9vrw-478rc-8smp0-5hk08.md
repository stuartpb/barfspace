# More Flexible Definitions for Longhorn-Friendly Volumes

I was wondering what labels could be used for, but now I'm thinking, you could have different volume GUIDs with different rules for how to interpret the GPT label:

- Label selector for nodes to attach the partition to
- Attribute selector
- Tolerations
- Some mix of these

these would be used to attach the physical disk/partition to the right VM instance
