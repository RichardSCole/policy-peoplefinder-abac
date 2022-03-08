package peoplefinder.POST.api.users.__id

import input.policy.path
import input.user.attributes

default allowed = false

default visible = false

default enabled = false

allowed {
    some index
    data.roles[attributes.roles[index]].perms[path].allowed
}

allowed {
    dir.is_manager_of(input.user.id, input.resource.id)
}

visible {
    some index
    data.roles[attributes.roles[index]].perms[path].visible
}

enabled {
    some index
    data.roles[attributes.roles[index]].perms[path].enabled
}

enabled {
    allowed
}