"use client";

import React from "react";
import Image, { ImageProps } from "next/image";
import { cn } from "@/lib/utils";
import { Image as ImageIcon } from "lucide-react";

interface SmartImageProps extends Omit<ImageProps, "onError"> {
  fallback?: React.ReactNode;
  containerClassName?: string;
}

export function SmartImage({
  src,
  alt,
  className,
  containerClassName,
  fallback,
  ...props
}: SmartImageProps) {
  const [error, setError] = React.useState(false);

  if (error || !src) {
    return (
      <div
        className={cn(
          "flex items-center justify-center bg-surface-container-high text-on-surface-variant rounded-lg",
          containerClassName
        )}
      >
        {fallback || <ImageIcon size={24} />}
      </div>
    );
  }

  return (
    <div className={cn("relative overflow-hidden rounded-lg", containerClassName)}>
      <Image
        src={src}
        alt={alt}
        className={cn("object-cover transition-opacity duration-300", className)}
        onError={() => setError(true)}
        {...props}
      />
    </div>
  );
}
