export type BadgeVariant =
  | "note"
  | "danger"
  | "success"
  | "caution"
  | "tip"
  | "default";

export type BadgeType = "new" | "updated";

export const badgeConfig: Record<
  BadgeType,
  {
    text: string;
    variant: BadgeVariant;
  }
> = {
  new: {
    text: "New",
    variant: "success",
  },
  updated: {
    text: "Updated",
    variant: "caution",
  },
};

export function getBadgeConfig(type?: string) {
  if (!type) return null;
  return badgeConfig[type as BadgeType] ?? null;
}
