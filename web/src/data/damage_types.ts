export const damageTypesById: Record<number, { type: string; info?: string }> = {
  19: { type: "Rocket", info: "Actual damage type when damaged from a rocket launcher" },
  37: { type: "Burnt", info: "This is used by a damage by fire, even when the fire is created by a rocket explosion or a molotov" },
  49: { type: "Rammed" },
  50: { type: "Ranover", info: "This is also called when damaged because of helicopter blades" },
  51: { type: "Explosion", info: "This may sometimes also be used at an indirect damage through an exploding rocket" },
  52: { type: "Driveby", info: "This is NOT used for a driveby kill with e.g. the 'realdriveby' resource" },
  53: { type: "Drowned" },
  54: { type: "Fall" },
  55: { type: "Unknown", info: "No known information about this damage type" },
  56: { type: "Melee", info: "Seems to be never called (?); for an actual melee damage, the fist weapon ID (0) is used" },
  57: { type: "Weapon", info: "Seems to be never called (?)" },
  59: { type: "Tank Grenade" },
  63: { type: "Blown", info: "Actual damage type when dying in a vehicle explosion" }
};
