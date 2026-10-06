-- Tansi Cyril portfolio: public read access for published content
-- Run this in Supabase SQL Editor if the public site shows
-- "Selected work is temporarily unavailable" or similar.

alter table public.projects enable row level security;
alter table public.testimonials enable row level security;
alter table public.site_content enable row level security;

drop policy if exists "Public can read published projects" on public.projects;
create policy "Public can read published projects"
on public.projects
for select
to anon, authenticated
using (published = true);

drop policy if exists "Public can read published testimonials" on public.testimonials;
create policy "Public can read published testimonials"
on public.testimonials
for select
to anon, authenticated
using (published = true);

drop policy if exists "Public can read site content" on public.site_content;
create policy "Public can read site content"
on public.site_content
for select
to anon, authenticated
using (true);

-- If portfolio-media is a PUBLIC bucket, its existing public URLs will work.
-- If it is private, make the bucket public in Storage settings or create
-- an appropriate storage.objects SELECT policy instead of exposing private files.
