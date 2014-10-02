package t::MusicBrainz::Server::Controller::UnconfirmedEmailAddresses;
use Test::Routine;
use Test::Deep qw( cmp_set );
use Test::More;

use HTTP::Status ':constants';
use Hook::LexWrap;
use List::AllUtils 'uniq';
use MusicBrainz::Server::Test qw( html_ok );
use Set::Scalar;

with 't::Context', 't::Mechanize';

my @unconfirmed_email_whitelist;

test 'Paths that allow browsing without a confirmed email address' => sub {
    my $test = shift;
    my $c = $test->c;
    my $mech = $test->mech;

    my @actions_without_edit_attribute =
        map {
            my $fqn = $_->fully_qualified_name;
            $fqn =~ s/MusicBrainz::Server:://;
            $fqn;
        }
        grep {
            # Find all actions that users can access. These are actions that
            # are Local, or have a Path/PathPart
            my $attributes = Set::Scalar->new(@{$_->attributes});
            $attributes->size > 0 &&
            (
                (grep /^Path(Part)?/, $attributes->elements) > 0 ||
                $attributes->has('Local')
            ) &&
            !$attributes->has('Edit')
        }
        map { MusicBrainz::Server->controller($_)->get_action_methods }
        grep {
            # Find all concrete MusicBrainz::Server controllers
            my $controller = MusicBrainz::Server->controller($_);
            $controller->isa('Catalyst::Controller') &&
                $controller->meta->name =~ /^MusicBrainz::Server::Controller::/
        } MusicBrainz::Server->controllers;

    cmp_set(
        \@actions_without_edit_attribute,
        \@unconfirmed_email_whitelist
    );
};

@unconfirmed_email_whitelist = (
  "Controller::Account::Subscriptions::Artist::add",
  "Controller::Account::Subscriptions::Artist::remove",
  "Controller::Account::Subscriptions::Collection::add",
  "Controller::Account::Subscriptions::Collection::remove",
  "Controller::Account::Subscriptions::Editor::add",
  "Controller::Account::Subscriptions::Editor::remove",
  "Controller::Account::Subscriptions::Label::add",
  "Controller::Account::Subscriptions::Label::remove",
  "Controller::Account::Subscriptions::Series::add",
  "Controller::Account::Subscriptions::Series::remove",
  "Controller::Account::applications",
  "Controller::Account::change_password",
  "Controller::Account::donation",
  "Controller::Account::edit",
  "Controller::Account::edit_application",
  "Controller::Account::index",
  "Controller::Account::lost_password",
  "Controller::Account::lost_username",
  "Controller::Account::preferences",
  "Controller::Account::register",
  "Controller::Account::register_application",
  "Controller::Account::remove_application",
  "Controller::Account::resend_verification",
  "Controller::Account::reset_password",
  "Controller::Account::revoke_application_access",
  "Controller::Account::verify_email",
  "Controller::Admin::WikiDoc::history",
  "Controller::Admin::WikiDoc::index",
  "Controller::Admin::delete_user",
  "Controller::Admin::edit_banner",
  "Controller::Admin::edit_user",
  "Controller::Admin::index",
  "Controller::Ajax::filter_artist_recordings_form",
  "Controller::Ajax::filter_artist_release_groups_form",
  "Controller::Ajax::filter_artist_releases_form",
  "Controller::Area::alias",
  "Controller::Area::aliases",
  "Controller::Area::annotation_diff",
  "Controller::Area::annotation_history",
  "Controller::Area::annotation_revision",
  "Controller::Area::base",
  "Controller::Area::details",
  "Controller::Area::edits",
  "Controller::Area::latest_annotation",
  "Controller::Area::open_edits",
  "Controller::Area::show",
  "Controller::Area::tag_async",
  "Controller::Area::tags",
  "Controller::Area::wikipedia_extract",
  "Controller::Artist::alias",
  "Controller::Artist::aliases",
  "Controller::Artist::annotation_diff",
  "Controller::Artist::annotation_history",
  "Controller::Artist::annotation_revision",
  "Controller::Artist::base",
  "Controller::Artist::commons_image",
  "Controller::Artist::credit",
  "Controller::Artist::details",
  "Controller::Artist::edits",
  "Controller::Artist::import",
  "Controller::Artist::latest_annotation",
  "Controller::Artist::open_edits",
  "Controller::Artist::ratings",
  "Controller::Artist::relationships",
  "Controller::Artist::show",
  "Controller::Artist::tag_async",
  "Controller::Artist::tags",
  "Controller::Artist::wikipedia_extract",
  "Controller::AutoEditorElections::base",
  "Controller::AutoEditorElections::index",
  "Controller::AutoEditorElections::nominate",
  "Controller::AutoEditorElections::show",
  "Controller::Browse::area",
  "Controller::Browse::artist",
  "Controller::Browse::index",
  "Controller::Browse::instrument",
  "Controller::Browse::label",
  "Controller::Browse::place",
  "Controller::Browse::release",
  "Controller::Browse::release_group",
  "Controller::Browse::series",
  "Controller::Browse::work",
  "Controller::CDStub::add",
  "Controller::CDStub::base",
  "Controller::CDStub::browse",
  "Controller::CDStub::show",
  "Controller::CDTOC::attach",
  "Controller::CDTOC::base",
  "Controller::CDTOC::show",
  "Controller::Collection::base",
  "Controller::Collection::create",
  "Controller::Collection::edits",
  "Controller::Collection::open_edits",
  "Controller::Collection::show",
  "Controller::Doc::relationship_type",
  "Controller::Doc::show",
  "Controller::Edit::base",
  "Controller::Edit::edit_type",
  "Controller::Edit::edit_types",
  "Controller::Edit::enter_votes",
  "Controller::Edit::open",
  "Controller::Edit::search",
  "Controller::Edit::show",
  "Controller::Edit::subscribed",
  "Controller::Edit::subscribed_editors",
  "Controller::FreeDB::base",
  "Controller::FreeDB::show",
  "Controller::Instrument::alias",
  "Controller::Instrument::aliases",
  "Controller::Instrument::annotation_diff",
  "Controller::Instrument::annotation_history",
  "Controller::Instrument::annotation_revision",
  "Controller::Instrument::base",
  "Controller::Instrument::commons_image",
  "Controller::Instrument::details",
  "Controller::Instrument::edits",
  "Controller::Instrument::latest_annotation",
  "Controller::Instrument::open_edits",
  "Controller::Instrument::show",
  "Controller::Instrument::tag_async",
  "Controller::Instrument::tags",
  "Controller::Instrument::wikipedia_extract",
  "Controller::ISRC::_load",
  "Controller::ISRC::base",
  "Controller::ISRC::show",
  "Controller::ISWC::_load",
  "Controller::ISWC::base",
  "Controller::ISWC::show",
  "Controller::JS::js_text_setup",
  "Controller::JS::js_text_strings",
  "Controller::JS::statistics_js_text_strings",
  "Controller::Label::alias",
  "Controller::Label::aliases",
  "Controller::Label::annotation_diff",
  "Controller::Label::annotation_history",
  "Controller::Label::annotation_revision",
  "Controller::Label::base",
  "Controller::Label::details",
  "Controller::Label::edits",
  "Controller::Label::latest_annotation",
  "Controller::Label::open_edits",
  "Controller::Label::ratings",
  "Controller::Label::relationships",
  "Controller::Label::show",
  "Controller::Label::tag_async",
  "Controller::Label::tags",
  "Controller::Label::wikipedia_extract",
  "Controller::OAuth2::authorize",
  "Controller::OAuth2::oob",
  "Controller::OAuth2::token",
  "Controller::OAuth2::tokeninfo",
  "Controller::OAuth2::userinfo",
  "Controller::OtherLookup::artist-ipi",
  "Controller::OtherLookup::artist-isni",
  "Controller::OtherLookup::barcode",
  "Controller::OtherLookup::catno",
  "Controller::OtherLookup::discid",
  "Controller::OtherLookup::freedbid",
  "Controller::OtherLookup::index",
  "Controller::OtherLookup::isrc",
  "Controller::OtherLookup::iswc",
  "Controller::OtherLookup::label-ipi",
  "Controller::OtherLookup::label-isni",
  "Controller::OtherLookup::mbid",
  "Controller::OtherLookup::url",
  "Controller::Partners::amazon",
  "Controller::Place::alias",
  "Controller::Place::aliases",
  "Controller::Place::annotation_diff",
  "Controller::Place::annotation_history",
  "Controller::Place::annotation_revision",
  "Controller::Place::base",
  "Controller::Place::commons_image",
  "Controller::Place::details",
  "Controller::Place::edits",
  "Controller::Place::latest_annotation",
  "Controller::Place::open_edits",
  "Controller::Place::show",
  "Controller::Place::tag_async",
  "Controller::Place::tags",
  "Controller::Place::wikipedia_extract",
  "Controller::Rating::rate",
  "Controller::Recording::annotation_diff",
  "Controller::Recording::annotation_history",
  "Controller::Recording::annotation_revision",
  "Controller::Recording::base",
  "Controller::Recording::details",
  "Controller::Recording::edits",
  "Controller::Recording::fingerprints",
  "Controller::Recording::latest_annotation",
  "Controller::Recording::open_edits",
  "Controller::Recording::ratings",
  "Controller::Recording::show",
  "Controller::Recording::tag_async",
  "Controller::Recording::tags",
  "Controller::Relationship::LinkAttributeType::base",
  "Controller::Relationship::LinkAttributeType::create",
  "Controller::Relationship::LinkAttributeType::index",
  "Controller::Relationship::LinkType::base",
  "Controller::Relationship::LinkType::create",
  "Controller::Relationship::LinkType::index",
  "Controller::Relationship::LinkType::tree",
  "Controller::Relationship::LinkType::type_specific",
  "Controller::Release::annotation_diff",
  "Controller::Release::annotation_history",
  "Controller::Release::annotation_revision",
  "Controller::Release::base",
  "Controller::Release::cover_art",
  "Controller::Release::cover_art_uploaded",
  "Controller::Release::details",
  "Controller::Release::edits",
  "Controller::Release::latest_annotation",
  "Controller::Release::lookup",
  "Controller::Release::open_edits",
  "Controller::Release::show",
  "Controller::Release::tag_async",
  "Controller::Release::tags",
  "Controller::ReleaseGroup::annotation_diff",
  "Controller::ReleaseGroup::annotation_history",
  "Controller::ReleaseGroup::annotation_revision",
  "Controller::ReleaseGroup::base",
  "Controller::ReleaseGroup::details",
  "Controller::ReleaseGroup::edits",
  "Controller::ReleaseGroup::latest_annotation",
  "Controller::ReleaseGroup::open_edits",
  "Controller::ReleaseGroup::ratings",
  "Controller::ReleaseGroup::show",
  "Controller::ReleaseGroup::tag_async",
  "Controller::ReleaseGroup::tags",
  "Controller::ReleaseGroup::wikipedia_extract",
  "Controller::Report::index",
  "Controller::Report::show",
  "Controller::Root::default",
  "Controller::Root::index",
  "Controller::Root::set_beta_preference",
  "Controller::Root::set_language",
  "Controller::Search::search",
  "Controller::Series::alias",
  "Controller::Series::aliases",
  "Controller::Series::annotation_diff",
  "Controller::Series::annotation_history",
  "Controller::Series::annotation_revision",
  "Controller::Series::base",
  "Controller::Series::details",
  "Controller::Series::edits",
  "Controller::Series::latest_annotation",
  "Controller::Series::open_edits",
  "Controller::Series::show",
  "Controller::Series::tag_async",
  "Controller::Series::tags",
  "Controller::Series::wikipedia_extract",
  "Controller::Statistics::countries",
  "Controller::Statistics::coverart",
  "Controller::Statistics::dataset",
  "Controller::Statistics::editors",
  "Controller::Statistics::edits",
  "Controller::Statistics::formats",
  "Controller::Statistics::individual_timeline",
  "Controller::Statistics::languages_scripts",
  "Controller::Statistics::relationships",
  "Controller::Statistics::statistics",
  "Controller::Statistics::timeline",
  "Controller::Statistics::timeline_redirect",
  "Controller::Tag::base",
  "Controller::Tag::cloud",
  "Controller::Tag::release",
  "Controller::Tag::release_group",
  "Controller::Tag::show",
  "Controller::TagLookup::index",
  "Controller::Test::accept_edit",
  "Controller::Test::reject_edit",
  "Controller::Track::base",
  "Controller::Track::show",
  "Controller::URL::base",
  "Controller::URL::edits",
  "Controller::URL::open_edits",
  "Controller::URL::show",
  "Controller::User::Edits::accepted",
  "Controller::User::Edits::all",
  "Controller::User::Edits::autoedits",
  "Controller::User::Edits::cancelled",
  "Controller::User::Edits::failed",
  "Controller::User::Edits::open",
  "Controller::User::Edits::rejected",
  "Controller::User::Edits::votes",
  "Controller::User::base",
  "Controller::User::collections",
  "Controller::User::login",
  "Controller::User::logout",
  "Controller::User::privileged",
  "Controller::User::profile",
  "Controller::User::rating_summary",
  "Controller::User::ratings",
  "Controller::User::tag",
  "Controller::User::tags",
  "Controller::WS::1::Artist::lookup",
  "Controller::WS::1::Artist::root",
  "Controller::WS::1::Collection::collection",
  "Controller::WS::1::Label::lookup",
  "Controller::WS::1::Label::root",
  "Controller::WS::1::Rating::rating",
  "Controller::WS::1::Release::lookup",
  "Controller::WS::1::Release::root",
  "Controller::WS::1::Release::search",
  "Controller::WS::1::ReleaseGroup::lookup",
  "Controller::WS::1::ReleaseGroup::root",
  "Controller::WS::1::Tag::tag",
  "Controller::WS::1::Track::lookup",
  "Controller::WS::1::Track::root",
  "Controller::WS::1::Track::search",
  "Controller::WS::1::User::user_repository",
  "Controller::WS::2::Annotation::annotation_search",
  "Controller::WS::2::Annotation::base",
  "Controller::WS::2::Area::area",
  "Controller::WS::2::Area::area_search",
  "Controller::WS::2::Area::base",
  "Controller::WS::2::Artist::artist",
  "Controller::WS::2::Artist::artist_search",
  "Controller::WS::2::Artist::base",
  "Controller::WS::2::CDStub::cdstub_search",
  "Controller::WS::2::Collection::base",
  "Controller::WS::2::Collection::list_list",
  "Controller::WS::2::Collection::releases",
  "Controller::WS::2::Collection::releases_get",
  "Controller::WS::2::DiscID::discid",
  "Controller::WS::2::FreeDB::freedb_search",
  "Controller::WS::2::Instrument::base",
  "Controller::WS::2::Instrument::instrument",
  "Controller::WS::2::Instrument::instrument_search",
  "Controller::WS::2::ISRC::isrc",
  "Controller::WS::2::ISWC::iswc",
  "Controller::WS::2::Label::base",
  "Controller::WS::2::Label::label",
  "Controller::WS::2::Label::label_search",
  "Controller::WS::2::PUID::puid",
  "Controller::WS::2::Place::base",
  "Controller::WS::2::Place::place",
  "Controller::WS::2::Place::place_search",
  "Controller::WS::2::Rating::rating_lookup",
  "Controller::WS::2::Recording::base",
  "Controller::WS::2::Recording::recording",
  "Controller::WS::2::Recording::recording_search",
  "Controller::WS::2::Release::base",
  "Controller::WS::2::Release::release",
  "Controller::WS::2::Release::release_search",
  "Controller::WS::2::ReleaseGroup::base",
  "Controller::WS::2::ReleaseGroup::release_group",
  "Controller::WS::2::ReleaseGroup::release_group_search",
  "Controller::WS::2::Series::base",
  "Controller::WS::2::Series::series",
  "Controller::WS::2::Series::series_search",
  "Controller::WS::2::Tag::tag_search",
  "Controller::WS::2::URL::base",
  "Controller::WS::2::URL::url",
  "Controller::WS::2::URL::url_search",
  "Controller::WS::2::Work::base",
  "Controller::WS::2::Work::work",
  "Controller::WS::2::Work::work_search",
  "Controller::WS::js::Area::search",
  "Controller::WS::js::Artist::search",
  "Controller::WS::js::Editor::search",
  "Controller::WS::js::Instrument::search",
  "Controller::WS::js::Label::search",
  "Controller::WS::js::Place::search",
  "Controller::WS::js::Plurals::translate",
  "Controller::WS::js::Recording::search",
  "Controller::WS::js::Release::release",
  "Controller::WS::js::Release::search",
  "Controller::WS::js::ReleaseGroup::search",
  "Controller::WS::js::Series::search",
  "Controller::WS::js::Work::search",
  "Controller::WS::js::cdstub",
  "Controller::WS::js::cdstub_search",
  "Controller::WS::js::cover_art_upload",
  "Controller::WS::js::default",
  "Controller::WS::js::entity",
  "Controller::WS::js::error",
  "Controller::WS::js::events",
  "Controller::WS::js::freedb",
  "Controller::WS::js::freedb_search",
  "Controller::WS::js::medium",
  "Controller::WS::js::medium_search",
  "Controller::WS::js::LastUpdatedRecordings::recent",
  "Controller::Watch::list",
  "Controller::Work::alias",
  "Controller::Work::aliases",
  "Controller::Work::annotation_diff",
  "Controller::Work::annotation_history",
  "Controller::Work::annotation_revision",
  "Controller::Work::base",
  "Controller::Work::details",
  "Controller::Work::edits",
  "Controller::Work::latest_annotation",
  "Controller::Work::open_edits",
  "Controller::Work::ratings",
  "Controller::Work::show",
  "Controller::Work::tag_async",
  "Controller::Work::tags",
  "Controller::Work::wikipedia_extract",
  "ControllerBase::WS::1::load",
  "ControllerBase::WS::1::root",
  "ControllerBase::WS::1::search",
  "ControllerBase::WS::2::root",
  "ControllerBase::WS::js::root",
  "ControllerBase::WS::js::root",
);


1;
