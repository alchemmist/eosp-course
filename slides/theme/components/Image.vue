<script setup lang="ts">
import { ref, computed } from "vue";
import { handleBackground } from "../layoutHelper";

const props = defineProps({
  src: { type: String, required: true },
  alt: { type: String, default: "" },
  class: { type: String, default: "" },
  width: { type: String, default: "100%" },
  backgroundSize: { type: String, default: "contain" },
  dim: { type: Boolean, default: false },
  style: { type: Object as () => Record<string, string>, default: () => ({}) },
});

// resolvedSrc безопасно для dev и build
const resolvedSrc = computed(() => new URL(props.src, import.meta.url).href);

// natural aspect ratio
const imgAspect = ref<number | null>(null);
const loadImage = () => {
  const img = new Image();
  img.src = resolvedSrc.value;
  img.onload = () => {
    imgAspect.value = img.naturalHeight / img.naturalWidth;
  };
};
loadImage();

// style для div с background-image
const backgroundStyle = computed(() => {
  const style: Record<string, string> = {
    ...handleBackground(resolvedSrc.value, props.dim, props.backgroundSize),
    width: props.width ?? "100%",
    ...props.style,
  };

  if (imgAspect.value) {
    style.aspectRatio = `${1 / imgAspect.value}`; // width / height
  }

  return style;
});
</script>

<template>
  <div
    :class="['slidev-image', props.class]"
    :style="backgroundStyle"
    role="img"
    :aria-label="alt"
  />
</template>
