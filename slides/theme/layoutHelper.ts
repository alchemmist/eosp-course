import type { CSSProperties } from "vue";

/**
 * Resolve urls from frontmatter and append with the base url
 */
export function resolveAssetUrl(url: string) {
  if (url.startsWith("/")) return import.meta.env.BASE_URL + url.slice(1);
  return url;
}

export function handleBackground(
  background?: string,
  dim = false,
  backgroundPosition: string = "center center",
  backgroundSize: string = "cover",
  backgroundRepeat: string = "no-repeat",
): CSSProperties {
  const isColor =
    background && ["#", "rgb", "hsl"].some((v) => background.indexOf(v) === 0);

  const style = {
    background: isColor ? background : undefined,
    color: background && !isColor ? "white" : undefined,
    backgroundImage: isColor
      ? undefined
      : background
        ? dim
          ? `linear-gradient(#0005, #0008), url(${resolveAssetUrl(background)})`
          : `url("${resolveAssetUrl(background)}")`
        : undefined,
    backgroundRepeat: backgroundRepeat,
    backgroundPosition: backgroundPosition,
    backgroundSize: backgroundSize,
  };

  if (!style.background) delete style.background;

  return style;
}
