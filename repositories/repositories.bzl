"""Handles imports of external/third-party repositories.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load(
    "@com_github_mvukov_rules_ros2//repositories:ros2_repositories_impl.bzl",
    "ros2_repositories_impl",
)

def ros2_workspace_repositories():
    """Imports dependent third-party repositories for the non-blzmod (hence, workspace-) version of the repository.

    In particular, imports third-party package repositories excluding ROS 2 packages. ROS 2-specific repositories are imported with `ros2_repositories()` macro.
    """
    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "ca77768989a7f311186a29747e3e95c936a41dffac779aff6b443db22290d913",
        strip_prefix = "rules_python-0.36.0",
        url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.36.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = ["https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz"],
        sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
    )

    maybe(
        http_archive,
        name = "fmt",
        build_file = "@com_github_mvukov_rules_ros2//repositories:fmt.BUILD.bazel",
        sha256 = "5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2",
        strip_prefix = "fmt-9.1.0",
        url = "https://github.com/fmtlib/fmt/archive/9.1.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "spdlog",
        build_file = "@com_github_mvukov_rules_ros2//repositories:spdlog.BUILD.bazel",
        sha256 = "1586508029a7d0670dfcb2d97575dcdc242d3868a259742b69f100801ab4e16b",
        strip_prefix = "spdlog-1.14.1",
        url = "https://github.com/gabime/spdlog/archive/v1.14.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "libyaml",
        build_file = "@com_github_mvukov_rules_ros2//repositories:libyaml.BUILD.bazel",
        sha256 = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4",
        strip_prefix = "yaml-0.2.5",
        urls = ["https://github.com/yaml/libyaml/releases/download/0.2.5/yaml-0.2.5.tar.gz"],
    )

    maybe(
        http_archive,
        name = "pybind11",
        build_file = "@com_github_mvukov_rules_ros2//repositories:pybind11.BUILD.bazel",
        sha256 = "e08cb87f4773da97fa7b5f035de8763abc656d87d5773e62f6da0587d1f0ec20",
        strip_prefix = "pybind11-2.13.6",
        urls = ["https://github.com/pybind/pybind11/archive/refs/tags/v2.13.6.tar.gz"],
    )

    maybe(
        http_archive,
        name = "bazel_features",
        sha256 = "b4b145c19e08fd48337f53c383db46398d0a810002907ff0c590762d926e05be",
        strip_prefix = "bazel_features-1.18.0",
        url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.18.0/bazel_features-v1.18.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "a2e6fb56e649c1ee79703e99aa0c9d13c6cc53c8d7a0cbb8797ab2888bbc99a3",
        strip_prefix = "rules_foreign_cc-0.12.0",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.12.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "googletest",
        sha256 = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926",
        strip_prefix = "googletest-1.15.2",
        url = "https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz",
    )

    _googletest_deps()

    maybe(
        http_archive,
        name = "tinyxml2",
        build_file = "@com_github_mvukov_rules_ros2//repositories:tinyxml2.BUILD.bazel",
        sha256 = "3bdf15128ba16686e69bce256cc468e76c7b94ff2c7f391cc5ec09e40bff3839",
        strip_prefix = "tinyxml2-10.0.0",
        urls = ["https://github.com/leethomason/tinyxml2/archive/refs/tags/10.0.0.tar.gz"],
    )

    maybe(
        http_archive,
        name = "readerwriterqueue",
        build_file = "@com_github_mvukov_rules_ros2//repositories:readerwriterqueue.BUILD.bazel",
        sha256 = "fc68f55bbd49a8b646462695e1777fb8f2c0b4f342d5e6574135211312ba56c1",
        strip_prefix = "readerwriterqueue-1.0.6",
        urls = ["https://github.com/cameron314/readerwriterqueue/archive/refs/tags/v1.0.6.tar.gz"],
    )

    maybe(
        http_archive,
        name = "sqlite3",
        build_file = "@com_github_mvukov_rules_ros2//repositories:sqlite3.BUILD.bazel",
        sha256 = "ad68c1216c3a474cf360c7581a4001e952515b3649342100f2d7ca7c8e313da6",
        strip_prefix = "sqlite-amalgamation-3240000",
        urls = ["https://www.sqlite.org/2018/sqlite-amalgamation-3240000.zip"],
    )

    maybe(
        http_archive,
        name = "nlohmann_json",
        sha256 = "a22461d13119ac5c78f205d3df1db13403e58ce1bb1794edc9313677313f4a9d",
        urls = ["https://github.com/nlohmann/json/releases/download/v3.11.3/include.zip"],
    )

    maybe(
        http_archive,
        name = "websocketpp",
        build_file = "@com_github_mvukov_rules_ros2//repositories:websocketpp.BUILD.bazel",
        sha256 = "6ce889d85ecdc2d8fa07408d6787e7352510750daa66b5ad44aacb47bea76755",
        strip_prefix = "websocketpp-0.8.2",
        urls = ["https://github.com/zaphoyd/websocketpp/archive/refs/tags/0.8.2.tar.gz"],
    )

    maybe(
        http_archive,
        name = "asio",
        build_file = "@com_github_mvukov_rules_ros2//repositories:asio.BUILD.bazel",
        sha256 = "530540f973498c2d297771af1bc852f69b27509bbb56bc7ac3309c928373286f",
        strip_prefix = "asio-asio-1-31-0",
        url = "https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-1-31-0.tar.gz",
    )

    # We're pointing at hedronvision's mirror of google/boringssl:main-with-bazel to get
    # Renovate auto-update. Otherwise, Renovate will keep moving us back to main, which doesn't
    # support Bazel.
    maybe(
        http_archive,
        name = "boringssl",
        sha256 = "7048ac20b097734b308b48f203266baef1c8377865935c1bfb03107eb11d14f0",
        strip_prefix = "boringssl-8ee0841a03d5686969fc9c1ab5154252645691ce",
        urls = ["https://github.com/hedronvision/boringssl/archive/8ee0841a03d5686969fc9c1ab5154252645691ce.tar.gz"],
    )

    maybe(
        http_archive,
        name = "zlib",
        build_file = "@com_github_mvukov_rules_ros2//repositories:zlib.BUILD.bazel",
        sha256 = "d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98",
        strip_prefix = "zlib-1.2.13",
        urls = [
            "https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.xz",
            "https://zlib.net/zlib-1.2.13.tar.xz",
        ],
    )

    maybe(
        http_archive,
        name = "tinyxml",
        build_file = "@com_github_mvukov_rules_ros2//repositories:tinyxml.BUILD.bazel",
        sha256 = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593",
        urls = [
            "http://archive.ubuntu.com/ubuntu/pool/universe/t/tinyxml/tinyxml_2.6.2.orig.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "curl",
        build_file = "@com_github_mvukov_rules_ros2//repositories:curl.BUILD.bazel",
        sha256 = "77c0e1cd35ab5b45b659645a93b46d660224d0024f1185e8a95cdb27ae3d787d",
        strip_prefix = "curl-8.8.0",
        urls = ["https://github.com/curl/curl/releases/download/curl-8_8_0/curl-8.8.0.tar.gz"],
        patch_args = ["-p1"],
        patches = ["@com_github_mvukov_rules_ros2//repositories/patches:curl_fix_openssl.patch"],
    )

    maybe(
        http_archive,
        name = "zstd",
        build_file = "@com_github_mvukov_rules_ros2//repositories:zstd.BUILD.bazel",
        sha256 = "8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1",
        strip_prefix = "zstd-1.5.6",
        urls = ["https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz"],
    )

    maybe(
        http_archive,
        name = "lz4",
        build_file = "@com_github_mvukov_rules_ros2//repositories:lz4.BUILD.bazel",
        sha256 = "4ec935d99aa4950eadfefbd49c9fad863185ac24c32001162c44a683ef61b580",
        strip_prefix = "lz4-1.9.3",
        urls = ["https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.zip"],
    )

    maybe(
        http_archive,
        name = "yaml-cpp",
        build_file = "@com_github_mvukov_rules_ros2//repositories:yaml-cpp.BUILD.bazel",
        sha256 = "43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3",
        strip_prefix = "yaml-cpp-yaml-cpp-0.7.0",
        urls = ["https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.7.0.tar.gz"],
    )

    maybe(
        http_archive,
        name = "eigen",
        build_file = "@com_github_mvukov_rules_ros2//repositories:eigen.BUILD.bazel",
        sha256 = "8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72",
        strip_prefix = "eigen-3.4.0",
        urls = ["https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz"],
    )

    maybe(
        http_archive,
        name = "rules_license",
        sha256 = "26d4021f6898e23b82ef953078389dd49ac2b5618ac564ade4ef87cced147b38",
        urls = [
            "https://github.com/bazelbuild/rules_license/releases/download/1.0.0/rules_license-1.0.0.tar.gz",
        ],
    )

def ros2_repositories():
    """Import ROS 2 repositories."""

    maybe(
        http_archive,
        name = "ros2",
        build_file = "@com_github_mvukov_rules_ros2//repositories:ros2.BUILD.bazel",
        sha256 = "cb14a8b24ef890269c4be89b29ef52e8f26282326e3b811af2beb1abdc4d8806",
        strip_prefix = "ros2-release-humble-20240523",
        urls = ["https://github.com/ros2/ros2/archive/refs/tags/release-humble-20240523.tar.gz"],
    )

    ros2_repositories_impl()

    # ros2-devel branch
    maybe(
        http_archive,
        name = "ros2_gps_umd",
        build_file = "@com_github_mvukov_rules_ros2//repositories:gps_umd.BUILD.bazel",
        sha256 = "64a96f93053d0d59e8fcccceab5408a7d666dd813d4c12df139ef24d916f49ab",
        strip_prefix = "gps_umd-fc782811804fafb12ee479a48a2aa2e9ee942e2d",
        urls = ["https://github.com/swri-robotics/gps_umd/archive/fc782811804fafb12ee479a48a2aa2e9ee942e2d.tar.gz"],
    )

    maybe(
        http_archive,
        name = "foxglove_bridge",
        build_file = "@com_github_mvukov_rules_ros2//repositories:foxglove_bridge.BUILD.bazel",
        sha256 = "9548f6a53794cfcd6dcae570e6e82aa2c7670d177269ecf612838655d7ba7dcc",
        strip_prefix = "ros-foxglove-bridge-0.7.9",
        urls = ["https://github.com/foxglove/ros-foxglove-bridge/archive/refs/tags/0.7.9.tar.gz"],
    )

    maybe(
        http_archive,
        name = "ros2_xacro",
        build_file = "@com_github_mvukov_rules_ros2//repositories:xacro.BUILD.bazel",
        sha256 = "a8802a5b48f7479bae1238e822ac4ebb47660221eb9bc40a608e899d60f3f7e4",
        strip_prefix = "xacro-2.0.9",
        urls = ["https://github.com/ros/xacro/archive/refs/tags/2.0.9.tar.gz"],
    )

    # Version copied from https://github.com/ros2/orocos_kdl_vendor/blob/0.2.5/orocos_kdl_vendor/CMakeLists.txt#L58.
    maybe(
        http_archive,
        name = "orocos_kdl",
        build_file = "@com_github_mvukov_rules_ros2//repositories:orocos_kdl.BUILD.bazel",
        sha256 = "22df47f63d91d014af2675029c23da83748575c12a6481fda3ed9235907cc259",
        strip_prefix = "orocos_kinematics_dynamics-507de66205e14b12c8c65f25eafc05c4dc66e21e",
        urls = ["https://github.com/orocos/orocos_kinematics_dynamics/archive/507de66205e14b12c8c65f25eafc05c4dc66e21e.tar.gz"],
    )

    maybe(
        http_archive,
        name = "ros2_urdf",
        build_file = "@com_github_mvukov_rules_ros2//repositories:urdf.BUILD.bazel",
        sha256 = "a762eb57dc7f60b9ada0240fd7c609f0dc5028ef0b4b65972daf91e009e52cf6",
        strip_prefix = "urdf-2.6.0",
        urls = ["https://github.com/ros2/urdf/archive/refs/tags/2.6.0.tar.gz"],
        patch_args = ["-p1"],
        patches = ["@com_github_mvukov_rules_ros2//repositories/patches:urdf_plugin_loader_fix.patch"],
    )

    maybe(
        http_archive,
        name = "ros2_diagnostics",
        build_file = "@com_github_mvukov_rules_ros2//repositories:diagnostics.BUILD.bazel",
        sha256 = "a723dae7acf0f00ee643c076c7c81299be0254919f29225ec7a89dc14cb8ea6f",
        strip_prefix = "diagnostics-9f402787ea2c9b3dd4d7e51a9986810e8a3400ba",
        urls = ["https://github.com/ros/diagnostics/archive/9f402787ea2c9b3dd4d7e51a9986810e8a3400ba.zip"],
    )

    maybe(
        http_archive,
        name = "console_bridge",
        build_file = "@com_github_mvukov_rules_ros2//repositories:console_bridge.BUILD.bazel",
        sha256 = "303a619c01a9e14a3c82eb9762b8a428ef5311a6d46353872ab9a904358be4a4",
        strip_prefix = "console_bridge-1.0.2",
        urls = ["https://github.com/ros/console_bridge/archive/1.0.2.tar.gz"],
    )

    maybe(
        http_archive,
        name = "mcap",
        build_file = "@com_github_mvukov_rules_ros2//repositories:mcap.BUILD.bazel",
        sha256 = "2833f72344308ea58639f3b363a0cf17669580ae7ab435f43f3b104cff6ef548",
        strip_prefix = "mcap-releases-cpp-v0.8.0/cpp/mcap",
        urls = ["https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v0.8.0.tar.gz"],
    )

def _googletest_deps():
    """Lists implicit googletest WORKSPACE deps.

    Necessary such that e.g. `bazel fetch //...` can work.
    The versions below taken from https://github.com/google/googletest/blob/v1.13.0/WORKSPACE.

    TODO(mvukov) More recent commits in googletest have googletest_deps.bzl.
        Integrate once a new release is available.
    """
    maybe(
        http_archive,
        name = "com_google_absl",  # 2023-01-10T21:08:25Z
        sha256 = "f9a4e749f42c386a32a90fddf0e2913ed408d10c42f7f33ccf4c59ac4f0d1d05",
        strip_prefix = "abseil-cpp-52835439ca90d86b27bf8cd1708296e95604d724",
        urls = ["https://github.com/abseil/abseil-cpp/archive/52835439ca90d86b27bf8cd1708296e95604d724.zip"],
    )

    # Note this must use a commit from the `abseil` branch of the RE2 project.
    # https://github.com/google/re2/tree/abseil
    maybe(
        http_archive,
        name = "com_googlesource_code_re2",  # 2022-12-21T14:29:10Z
        sha256 = "b9ce3a51beebb38534d11d40f8928d40509b9e18a735f6a4a97ad3d014c87cb5",
        strip_prefix = "re2-d0b1f8f2ecc2ea74956c7608b6f915175314ff0e",
        urls = ["https://github.com/google/re2/archive/d0b1f8f2ecc2ea74956c7608b6f915175314ff0e.zip"],
    )
