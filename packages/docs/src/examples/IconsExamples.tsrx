import { Camera, CircleAlert, Compass, Heart, LucideProvider } from "@octaneui/icons/lucide";

export function IconsExamples() @{
  <>
    <Camera size={20} />
    <CircleAlert size={20} color="tomato" />
    <Heart size={20} strokeWidth={1.5} absoluteStrokeWidth />
    <LucideProvider color="rebeccapurple" strokeWidth={1.5}>
      <Compass size={20} />
    </LucideProvider>
  </>
}
